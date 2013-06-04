package todo.example
{
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	import todo.example.core.domain.TodoCollection;
	import todo.example.core.domain.api.ITodoCollection;
	import todo.example.core.ui.Popup;
	import todo.example.core.ui.api.IPopup;

	public class AppConfig implements IConfig
	{
		[Inject]
		public var injector: IInjector;
			
		public function configure(): void
		{
			injector.map(ITodoCollection).toSingleton(TodoCollection);
			injector.map(IPopup).toSingleton(Popup);
		}
	}
}