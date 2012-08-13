package todo.example.signal
{
	import org.osflash.signals.Signal;
	
	public class CreateNewTodoSignal extends Signal
	{
		public function CreateNewTodoSignal()
		{
			super(String);
		}
	}
}