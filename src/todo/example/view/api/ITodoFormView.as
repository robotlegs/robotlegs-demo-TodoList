package todo.example.view.api
{
	import org.osflash.signals.ISignal;

	public interface ITodoFormView extends IView
	{
		function get cancelSignal(): ISignal;
		function get saveSignal(): ISignal;
		
		function get taskDescription(): String;
	}
}