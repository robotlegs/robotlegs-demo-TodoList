package example.todo.todoForm.command
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.hasPropertyWithValue;
	import org.hamcrest.object.notNullValue;
	import org.mockito.integrations.any;
	import org.mockito.integrations.anyOf;
	import org.mockito.integrations.flexunit4.MockitoRule;
	import org.mockito.integrations.given;
	import org.mockito.integrations.havingPropertyOf;
	import org.mockito.integrations.mock;
	import org.mockito.integrations.times;
	import org.mockito.integrations.verify;
	
	import example.todo.core.domain.Todo;
	import example.todo.core.domain.api.ITodoCollection;

	[Mock(type="example.todo.core.domain.api.ITodoCollection")]
	public class CreateNewTodoCommandTests
	{
		[Rule]
		public var mockitoRule: MockitoRule = new MockitoRule();
		
		/**
		 * Tests that the command adds a new Todo to the todos collection
		 * with the task description that is set.
		 */
		[Test]
		public function execute_todoWithTaskDescriptionIsAddedToCollection(): void
		{
			const expectedTaskDescription: String = "My dummy task.";
			
			var createNewTodoCommand: CreateNewTodoCommand = createCommand();
			createNewTodoCommand.taskDescription = expectedTaskDescription;
			createNewTodoCommand.execute();
			
			verify(times(1)).that(createNewTodoCommand.todoCollection.add(havingPropertyOf("task", expectedTaskDescription)));
		}
		
		/**
		 * Creates the test subject with its dependencies.
		 */
		private function createCommand(): CreateNewTodoCommand
		{
			var createNewTodoCommand: CreateNewTodoCommand = new CreateNewTodoCommand();
			createNewTodoCommand.todoCollection = mock(ITodoCollection);
			return createNewTodoCommand;
		}
	}
}