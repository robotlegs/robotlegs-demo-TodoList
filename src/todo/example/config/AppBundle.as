package todo.example.config
{
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IContext;

	public class AppBundle extends MVCSBundle
	{
		override public function extend(context:IContext):void
		{
			super.extend(context);
			
			context.extend(SignalCommandMapExtension);
		}
	}
}