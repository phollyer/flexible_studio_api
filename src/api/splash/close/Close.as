package api.splash.close
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import api.splash.Splash;

	[Bindable]
	public class Close extends Splash
	{
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function close():void
		{
			ssCore.Splash.close( {} , {callback:actionComplete, errorSTR:"closeError", code:"5000"} );
		}
	}
}