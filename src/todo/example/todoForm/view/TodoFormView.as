package todo.example.todoForm.view
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.utils.StringUtil;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	import todo.example.todoForm.view.api.ITodoFormView;
	import todo.example.todoForm.view.ui.TodoFormViewBase;
	
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
		
		private var _saveSignal: Signal = new Signal();
		
		/**
		 * Dispatched when the user wants to save the
		 * description entered to the to do list.
		 */
		public function get saveSignal(): ISignal
		{
			return _saveSignal;
		}
		
		/**
		 * Description of a task entered by the user.
		 */
		public function get taskDescription(): String
		{
			return (taskDescriptionTextArea) ? taskDescriptionTextArea.text : null;
		}
		
		public function set taskDescription(value: String): void
		{
			taskDescriptionTextArea.text = value;
			validate();
		}
		
		override protected function childrenCreated():void
		{
			super.childrenCreated();
			
			cancelButton.addEventListener(MouseEvent.CLICK, cancel);
			saveButton.addEventListener(MouseEvent.CLICK, save);
			taskDescriptionTextArea.addEventListener(Event.CHANGE, validate);
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
			saveButton.removeEventListener(MouseEvent.CLICK, save);
			taskDescriptionTextArea.removeEventListener(Event.CHANGE, validate);
		}
		
		/**
		 * Handles the saveButton being clicked by the
		 * user by dispatching the saveSignal to notify
		 * listeners that the user wishes to save the
		 * task description entered.
		 */
		private function save(e: MouseEvent): void
		{
			saveSignal.dispatch();
		}
		
		/**
		 * Validates the task description, if it is deemed valid,
		 * then the save button is enabled, otherwise it is disabled.
		 */
		private function validate(e: Event = null): void
		{
			saveButton.enabled = (taskDescription != null && StringUtil.trim(taskDescription) != "");
		}
	}
}