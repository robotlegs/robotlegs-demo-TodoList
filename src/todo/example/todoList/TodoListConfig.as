package todo.example.todoList
{
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	import todo.example.todoList.command.CompleteTodoCommand;
	import todo.example.todoList.mediator.TodoListViewMediator;
	import todo.example.todoList.signal.CompleteTodoSignal;
	import todo.example.todoList.view.api.ITodoListView;
	
	public class TodoListConfig implements IConfig
	{
		[Inject]
		public var injector: Injector;
		
		[Inject]
		public var mediatorMap: IMediatorMap;
		
		[Inject]
		public var signalCommandMap: ISignalCommandMap;
		
		public function configure(): void
		{
			dependencies();
			mediators();
			signals();
		}
		
		/**
		 * Specifies all the dependencies for the feature
		 * that will be injected onto objects used by the
		 * application.
		 */
		private function dependencies(): void
		{
		}
		
		/**
		 * Maps view mediators to views.
		 */
		private function mediators(): void
		{
			mediatorMap.map(ITodoListView).toMediator(TodoListViewMediator);
		}
		
		/**
		 * Maps signals to commands using the signalCommandMap.
		 */
		private function signals(): void
		{
			signalCommandMap.map(CompleteTodoSignal).toCommand(CompleteTodoCommand);
		}
	}
}