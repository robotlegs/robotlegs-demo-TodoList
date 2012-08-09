package todo.example.bundle
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	import org.mockito.integrations.flexunit4.MockitoRule;
	import org.mockito.integrations.mock;
	import org.mockito.integrations.times;
	import org.mockito.integrations.verify;
	
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IBundle;
	import robotlegs.bender.framework.api.IContext;

	[Mock(type="robotlegs.bender.framework.api.IContext")]
	public class AppBundleTests
	{
		[Rule]
		public var mockitoRule: MockitoRule = new MockitoRule();
		
		/**
		 * Tests that the AppBundle implements IBundle.
		 */
		[Test]
		public function implements_expectedInterface(): void
		{
			assertThat(new AppBundle() as IBundle, notNullValue());
		}
		
		/**
		 * Tests that the SignalCommandMapExtension is added to the context. 
		 */
		[Test]
		public function extends_addsSignalCommandMapExtensionToContext(): void
		{
			var mockContext: IContext = mock(IContext);
			
			var appBundle: AppBundle = new AppBundle();
			appBundle.extend(mockContext);
			
			verify(times(1)).that(mockContext.extend(SignalCommandMapExtension));
		}
	}
}