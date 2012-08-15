package todo.example.signal
{
	import org.osflash.signals.Signal;
	
	import todo.example.domain.Todo;
	
	public class CompleteTodoSignal extends Signal
	{
		public function CompleteTodoSignal()
		{
			super(Todo);
		}
	}
}