package example.todo.todoForm.view.api
{
	import org.osflash.signals.ISignal;
	
	import example.todo.core.domain.Todo;
	import example.todo.core.view.IView;

	public interface ITodoFormView extends IView
	{
		function get cancelSignal(): ISignal;
		function get saveSignal(): ISignal;
		
		function get taskDescription(): String;
		function set taskDescription(value: String): void;
	}
}