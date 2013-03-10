package todo.example.todoList.command
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import todo.example.core.domain.Todo;
	import todo.example.core.domain.api.ITodoCollection;

	public class CompleteTodoCommand extends Command
	{
		[Inject]
		public var todoToComplete: Todo;
		
		[Inject]
		public var todoCollection: ITodoCollection;
		
		override public function execute():void
		{
			todoCollection.remove(todoToComplete);
		}
	}
}