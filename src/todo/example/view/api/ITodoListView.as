package todo.example.view.api
{
	import org.osflash.signals.ISignal;

	public interface ITodoListView
	{
		function get createNewSignal(): ISignal;
	}
}