package api.splash.close
{
	import api.events.splash.close.CloseEvent;

	import api.splash.Splash;

	import flash.events.EventDispatcher;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_close.html Northcode Help Documentation
	*/
	public class Close extends Splash
	{
		/**
		* Constructor for Splash.Close()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_close.html Northcode Help Documentation
		*/
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_close.html Northcode Help Documentation
		*/
		public function close():void
		{
			ssCore.Splash.close( {} , {callback:actionComplete, errorSTR:"closeError", code:"5000"} );
		}
	}
}