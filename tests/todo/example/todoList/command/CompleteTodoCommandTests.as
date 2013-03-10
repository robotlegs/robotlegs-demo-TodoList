package todo.example.todoList.command
{
	import org.mockito.integrations.flexunit4.MockitoRule;
	import org.mockito.integrations.mock;
	import org.mockito.integrations.times;
	import org.mockito.integrations.verify;
	
	import todo.example.domain.Todo;
	import todo.example.domain.api.ITodoCollection;

	[Mock(type="todo.example.domain.api.ITodoCollection")]
	public class CompleteTodoCommandTests
	{
		[Rule]
		public var mockitoRule: MockitoRule = new MockitoRule();
		
		/**
		 * Completing a Todo should remove the todo from the collection.
		 */
		[Test]
		public function execute_RemovesTodoFromTodoCollection(): void
		{
			var completedTodo: Todo = new Todo();
			var completeTodoCommand: CompleteTodoCommand = createCommand();
			completeTodoCommand.todoToComplete = completedTodo;
			completeTodoCommand.execute();
			
			verify(times(1)).that(completeTodoCommand.todoCollection.remove(completedTodo));
		}
		
		/**
		 * Creates the test subject with its dependencies.
		 */
		private function createCommand(): CompleteTodoCommand
		{
			var completeTodoCommand: CompleteTodoCommand = new CompleteTodoCommand();
			completeTodoCommand.todoCollection = mock(ITodoCollection);
			return completeTodoCommand;
		}
	}
}