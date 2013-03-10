package todo.example.todoForm.command
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.nullValue;
	import org.mockito.integrations.given;
	import org.mockito.integrations.mock;
	import org.mockito.integrations.times;
	import org.mockito.integrations.verify;
	
	import todo.example.domain.Todo;
	import todo.example.domain.api.ITodoCollection;

	[Mock(type="todo.example.domain.api.ITodoCollection")]
	public class UpdateTodoCommandTests
	{
		/**
		 * Tests that the command sets the taskDescription on the task property
		 * of the activeTodo in the TodoCollection.
		 */
		[Test]
		public function execute_ShouldSetTaskDescriptionOnActiveTodo(): void
		{
			const expectedTaskDescription: String = "My dummy task.";
			var activeTodo: Todo = new Todo();
			
			var updateTodoCommand: UpdateTodoCommand = createCommand(activeTodo);
			updateTodoCommand.taskDescription = expectedTaskDescription;
			updateTodoCommand.execute();
			
			assertThat(updateTodoCommand.todoCollection.activeTodo.task, equalTo(expectedTaskDescription));
		}

		/**
		 * Tests that the command nullifies the activeTodo on the TodoCollection.
		 */
		[Test]
		public function execute_ShouldUnsetActiveTodo(): void
		{
			var updateTodoCommand: UpdateTodoCommand = createCommand(new Todo());
			updateTodoCommand.taskDescription = "My dummy task>";
			updateTodoCommand.execute();
			
			verify(times(1)).that(updateTodoCommand.todoCollection.activeTodo = null);
		}
		
		/**
		 * Creates the test subject with its dependencies.
		 */
		private function createCommand(activeTodo: Todo): UpdateTodoCommand
		{
			var updateTodoCommand: UpdateTodoCommand = new UpdateTodoCommand();
			updateTodoCommand.todoCollection = mock(ITodoCollection);
			given(updateTodoCommand.todoCollection.activeTodo).willReturn(activeTodo);
			return updateTodoCommand;
		}
	}
}