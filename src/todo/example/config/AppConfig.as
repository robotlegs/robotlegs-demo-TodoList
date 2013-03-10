package todo.example.config
{
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	import todo.example.todoForm.command.CreateNewTodoCommand;
	import todo.example.todoForm.command.UpdateTodoCommand;
	import todo.example.domain.TodoCollection;
	import todo.example.domain.api.ITodoCollection;
	import todo.example.todoForm.mediator.TodoFormViewMediator;
	import todo.example.todoForm.signal.CreateNewTodoSignal;
	import todo.example.todoForm.signal.UpdateTodoSignal;
	import todo.example.todoList.command.CompleteTodoCommand;
	import todo.example.todoList.mediator.TodoListViewMediator;
	import todo.example.todoList.signal.CompleteTodoSignal;
	import todo.example.todoList.view.api.ITodoListView;
	import todo.example.ui.Popup;
	import todo.example.ui.api.IPopup;
	import todo.example.view.api.IMainView;
	import todo.example.todoForm.view.api.ITodoFormView;

	public class AppConfig implements IConfig
	{
		[Inject]
		public var injector: Injector;

		[Inject]
		public var mediatorMap: IMediatorMap;
		
		[Inject]
		public var signalCommandMap: ISignalCommandMap;
		
		// Wanted to use dependency injection via the constructor instead of the
		// properties above, however I found that when doing this the injector & mediatorMap
		// would be null. This could potentially be a bug with SwiftSuspenders or the RL 
		// framework or the setup of the custom AppBundle & Context is incorrect.
		public function AppConfig()
		{
			
		}
		
		public function configure(): void
		{
			dependencies();
			mediators();
			signals();
		}
		
		/**
		 * Specifies all the dependencies for the application
		 * that will be injected onto objects used by the
		 * application.
		 */
		private function dependencies(): void
		{
			injector.map(ITodoCollection).toSingleton(TodoCollection);
			injector.map(IPopup).toSingleton(Popup);
		}
		
		/**
		 * Maps view mediators to views.
		 */
		private function mediators(): void
		{
			mediatorMap.map(ITodoFormView).toMediator(TodoFormViewMediator);
			mediatorMap.map(ITodoListView).toMediator(TodoListViewMediator);
		}
		
		/**
		 * Maps signals to commands using the signalCommandMap.
		 */
		private function signals(): void
		{
			signalCommandMap.map(CreateNewTodoSignal).toCommand(CreateNewTodoCommand);
			signalCommandMap.map(CompleteTodoSignal).toCommand(CompleteTodoCommand);
			signalCommandMap.map(UpdateTodoSignal).toCommand(UpdateTodoCommand);
		}
	}
}