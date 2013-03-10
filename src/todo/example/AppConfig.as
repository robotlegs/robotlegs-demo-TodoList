package todo.example
{
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.framework.api.IConfig;
	
	import todo.example.core.domain.TodoCollection;
	import todo.example.core.domain.api.ITodoCollection;
	import todo.example.core.ui.Popup;
	import todo.example.core.ui.api.IPopup;

	public class AppConfig implements IConfig
	{
		[Inject]
		public var injector: Injector;
			
		public function configure(): void
		{
			injector.map(ITodoCollection).toSingleton(TodoCollection);
			injector.map(IPopup).toSingleton(Popup);
		}
	}
}