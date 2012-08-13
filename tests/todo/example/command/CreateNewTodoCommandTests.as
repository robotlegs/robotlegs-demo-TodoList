package todo.example.command
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
	
	import todo.example.domain.Todo;
	import todo.example.domain.TodoCollection;
	import todo.example.model.api.IModel;

	[Mock(type="todo.example.model.api.IModel")]
	[Mock(type="todo.example.domain.TodoCollection")]
	public class CreateNewTodoCommandTests
	{
		[Rule]
		public var mockitoRule: MockitoRule = new MockitoRule();
		
		private var _todoCollection: TodoCollection;
		
		/**
		 * Tests that the command adds a new Todo to the todos collection on the
		 * model with the task description that is set.
		 */
		[Test]
		public function execute_todoWithTaskDescriptionIsAddedToCollection(): void
		{
			const expectedTaskDescription: String = "My dummy task.";
			
			var createNewTodoCommand: CreateNewTodoCommand = createCommand();
			createNewTodoCommand.taskDescription = expectedTaskDescription;
			createNewTodoCommand.execute();
			
			verify(times(1)).that(_todoCollection.add(havingPropertyOf("task", expectedTaskDescription)));
		}
		
		/**
		 * Creates the test subject with its dependencies.
		 */
		private function createCommand(): CreateNewTodoCommand
		{
			var createNewTodoCommand: CreateNewTodoCommand = new CreateNewTodoCommand();
			createNewTodoCommand.model = mock(IModel);
			
			_todoCollection = mock(TodoCollection);
			given(createNewTodoCommand.model.todos).willReturn(_todoCollection);
			
			return createNewTodoCommand;
		}
	}
}