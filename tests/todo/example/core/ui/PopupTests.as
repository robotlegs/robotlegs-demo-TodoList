package todo.example.core.ui
{
	import org.mockito.integrations.any;
	import org.mockito.integrations.flexunit4.MockitoRule;
	import org.mockito.integrations.mock;
	import org.mockito.integrations.times;
	import org.mockito.integrations.verify;
	
	import robotlegs.bender.extensions.viewManager.api.IViewManager;
	
	import todo.example.core.view.IView;

	[Mock(type="todo.example.core.view.IView")]
	[Mock(type="robotlegs.bender.extensions.viewManager.api.IViewManager")]
	public class PopupTests
	{
		[Rule]
		public var mockitoRule: MockitoRule = new MockitoRule();
		
		/**
		 * Tests that when a popup is added it is added as a container to the
		 * viewManager which is part of the RL framework and will handle the 
		 * mediator creation.
		 */
		[Test]
		public function add_ShouldAddViewToTheViewManagerAsContainer(): void
		{
			var myView: IView = mock(IView);
			
			var popup: Popup = new Popup();
			popup.viewManager = mock(IViewManager);
			popup.add(myView);
			
			verify(times(1)).that(popup.viewManager.addContainer(any()));
		}
		
		/**
		 * Tests that when a popup is removed, it is removed as a container
		 * to the viewManager to ensure that the mediator & view is collected
		 * by the garbage collection.
		 */
		[Test]
		public function remove_ShouldRemoveViewFromViewManager(): void
		{
			var myView: IView = mock(IView);
			
			var popup: Popup = new Popup();
			popup.viewManager = mock(IViewManager);
			popup.remove(myView);
			
			verify(times(1)).that(popup.viewManager.removeContainer(any()));
		}
	}
}