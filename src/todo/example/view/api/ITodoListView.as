package todo.example.view.api
{
	import org.osflash.signals.ISignal;

	public interface ITodoListView extends IView
	{
		function get createNewSignal(): ISignal;
	}
}