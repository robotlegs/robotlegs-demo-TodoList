package todo.example.bundle
{
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IBundle;
	import robotlegs.bender.framework.api.IContext;

	public class AppBundle extends MVCSBundle implements IBundle
	{
		override public function extend(context:IContext):void
		{
			super.extend(context);
			
			context.install(SignalCommandMapExtension);
		}
	}
}