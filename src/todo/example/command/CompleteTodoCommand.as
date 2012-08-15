package todo.example.command
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import todo.example.domain.Todo;
	import todo.example.domain.api.ITodoCollection;

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