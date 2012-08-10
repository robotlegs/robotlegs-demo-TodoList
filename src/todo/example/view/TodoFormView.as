package todo.example.view
{
	import flash.events.MouseEvent;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	import todo.example.view.api.ITodoFormView;
	import todo.example.view.ui.TodoFormViewBase;
	
	public class TodoFormView extends TodoFormViewBase implements ITodoFormView
	{
		private var _cancelSignal: Signal = new Signal();
		
		/**
		 * Dispatched when the user wants to cancel the
		 * adding or modifying of a todo item.
		 */
		public function get cancelSignal(): ISignal
		{
			return _cancelSignal;
		}
		
		override protected function childrenCreated():void
		{
			super.childrenCreated();
			
			cancelButton.addEventListener(MouseEvent.CLICK, cancel);
		}
		
		/**
		 * Handles the cancelButton being clicked by the
		 * user by dispatching the cancelSignal.
		 */
		private function cancel(e: MouseEvent): void
		{
			_cancelSignal.dispatch();
		}
		
		public function dispose():void
		{
			_cancelSignal.removeAll();
			cancelButton.removeEventListener(MouseEvent.CLICK, cancel);
		}
	}
}