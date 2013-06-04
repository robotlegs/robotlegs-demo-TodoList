package example.todo
{
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	import example.todo.core.domain.TodoCollection;
	import example.todo.core.domain.api.ITodoCollection;
	import example.todo.core.ui.Popup;
	import example.todo.core.ui.api.IPopup;

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