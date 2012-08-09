package todo.example.config
{
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	import todo.example.mediator.MainViewMediator;
	import todo.example.model.Model;
	import todo.example.model.api.IModel;
	import todo.example.view.api.IMainView;

	public class AppConfiguration implements IConfig
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
		 * Specifies all the dependencies for the application
		 * that will be injected onto objects used by the
		 * application.
		 */
		private function dependencies(): void
		{
			injector.map(IModel).toSingleton(Model);
		}
		
		/**
		 * Maps view mediators to views.
		 */
		private function mediators(): void
		{
			mediatorMap.map(IMainView).toMediator(MainViewMediator);
		}
		
		/**
		 * Maps signals to commands using the signalCommandMap.
		 */
		private function signals(): void
		{
			
		}
	}
}