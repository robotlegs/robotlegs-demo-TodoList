package todo.example.bundle
{
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IBundle;
	import robotlegs.bender.framework.api.IContext;

	public class AppBundle implements IBundle
	{
		public function extend(context:IContext):void
		{
			context.install(new MVCSBundle());
			context.install(SignalCommandMapExtension);
		}
	}
}