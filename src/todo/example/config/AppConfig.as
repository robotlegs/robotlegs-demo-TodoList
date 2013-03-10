package todo.example.config
{
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.framework.api.IConfig;
	
	import todo.example.domain.TodoCollection;
	import todo.example.domain.api.ITodoCollection;
	import todo.example.ui.Popup;
	import todo.example.ui.api.IPopup;

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