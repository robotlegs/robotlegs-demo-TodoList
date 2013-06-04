package example.todo.todoForm
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	import example.todo.todoForm.command.CreateNewTodoCommand;
	import example.todo.todoForm.command.UpdateTodoCommand;
	import example.todo.todoForm.mediator.TodoFormViewMediator;
	import example.todo.todoForm.signal.CreateNewTodoSignal;
	import example.todo.todoForm.signal.UpdateTodoSignal;
	import example.todo.todoForm.view.api.ITodoFormView;

	public class TodoFormConfig implements IConfig
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
			mediatorMap.map(ITodoFormView).toMediator(TodoFormViewMediator);
		}
		
		/**
		 * Maps signals to commands using the signalCommandMap.
		 */
		private function signals(): void
		{
			signalCommandMap.map(CreateNewTodoSignal).toCommand(CreateNewTodoCommand);
			signalCommandMap.map(UpdateTodoSignal).toCommand(UpdateTodoCommand);
		}	
	}
}