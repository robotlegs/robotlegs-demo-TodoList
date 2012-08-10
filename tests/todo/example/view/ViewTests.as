package todo.example.view
{
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	
	import org.fluint.uiImpersonation.UIImpersonator;
	
	import spark.components.Button;

	public class ViewTests
	{
		/**
		 * Adds a UIComponent to a mock of the display list.
		 */
		protected function addToUI(view: UIComponent): void
		{
			UIImpersonator.addChild(view);
		}
		
		/**
		 * Generic teardown for each test.
		 */
		public function after(): void
		{
			UIImpersonator.removeAllChildren();
		}
		
		/**
		 * Mimics the user clicking a button.
		 */
		protected function click(button: Button): void
		{
			button.dispatchEvent(new MouseEvent(MouseEvent.CLICK));	
		}
	}
}