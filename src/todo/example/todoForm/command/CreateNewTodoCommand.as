package todo.example.todoForm.command
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import todo.example.core.domain.Todo;
	import todo.example.core.domain.api.ITodoCollection;
	
	public class CreateNewTodoCommand extends Command
	{
		[Inject]
		public var todoCollection: ITodoCollection;
		
		[Inject]
		public var taskDescription: String;
		
		override public function execute():void
		{
			var newTodo: Todo = new Todo();
			newTodo.task = taskDescription;
			
			todoCollection.add(newTodo);
		}
	}
}