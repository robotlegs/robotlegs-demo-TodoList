package todo.example.todoForm.view.api
{
	import org.osflash.signals.ISignal;
	
	import todo.example.domain.Todo;
	import todo.example.view.api.IView;

	public interface ITodoFormView extends IView
	{
		function get cancelSignal(): ISignal;
		function get saveSignal(): ISignal;
		
		function get taskDescription(): String;
		function set taskDescription(value: String): void;
	}
}