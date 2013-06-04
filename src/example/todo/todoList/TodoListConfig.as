package example.todo.todoList
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	import example.todo.todoList.command.CompleteTodoCommand;
	import example.todo.todoList.mediator.TodoListViewMediator;
	import example.todo.todoList.signal.CompleteTodoSignal;
	import example.todo.todoList.view.api.ITodoListView;
	
	public class TodoListConfig implements IConfig
	{
		[Inject]
		public var injector: IInjector;
		
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