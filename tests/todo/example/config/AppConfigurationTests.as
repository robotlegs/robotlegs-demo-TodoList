package todo.example.config
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	import org.mockito.integrations.flexunit4.MockitoRule;
	import org.mockito.integrations.mock;
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	[Mock(type="org.swiftsuspenders.Injector")]
	[Mock(type="robotlegs.bender.extensions.mediatorMap.api.IMediatorMap")]
	public class AppConfigurationTests
	{
		[Rule]
		public var mockitoRule:MockitoRule = new MockitoRule();
		
		/**
		 * Tests that the AppConfiguration implements IConfig.
		 */
		[Test]
		public function implements_expectedInterface(): void
		{
			assertThat(new AppConfiguration(mock(Injector), mock(IMediatorMap)) as IConfig, notNullValue());
		}
	}
}