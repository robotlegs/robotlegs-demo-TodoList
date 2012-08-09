package todo.example.config
{
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	
	import todo.example.mediator.MainViewMediator;
	import todo.example.model.Model;
	import todo.example.model.api.IModel;
	import todo.example.view.api.IMainView;

	public class AppConfiguration implements IConfig
	{
		private var _injector: Injector;
		private var _mediatorMap: IMediatorMap;
		
		public function AppConfiguration(injector: Injector, mediatorMap:IMediatorMap)
		{
			_injector = injector;
			_mediatorMap = mediatorMap;
		}
		
		public function configure(): void
		{
			dependencies();
			mediators();
		}
		
		/**
		 * Specifies all the dependencies for the application
		 * that will be injected onto objects used by the
		 * application.
		 */
		private function dependencies(): void
		{
			_injector.map(IModel).toSingleton(Model);
		}
		
		/**
		 * Maps view mediators to views.
		 */
		private function mediators(): void
		{
			_mediatorMap.map(IMainView).toMediator(MainViewMediator);
		}
	}
}