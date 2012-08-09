package todo.example.config
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	public class AppConfiguration implements IConfig
	{
		private var _mediatorMap: IMediatorMap;
		
		public function AppConfiguration(mediatorMap:IMediatorMap)
		{
			_mediatorMap = mediatorMap;
		}
		
		public function configure(): void
		{
			
		}
	}
}