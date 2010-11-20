/**
 * Class used only inside a Splash Screen
 * To receive data and/commands from the
 * Main Application
 **/

package api.splash.screen
{
	import flash.events.IEventDispatcher;
	import flash.external.ExternalInterface;
	import api.splash.Splash;
	
	[Bindable]
	public class Screen extends Splash
	{
		public var data:String = null;
		
		public function Screen(target:IEventDispatcher=null)
		{
			super(target);
			
			switch(ExternalInterface.available)
			{
				case true:
			    	ExternalInterface.addCallback('onSplashData', onSplashData);
			}
		}
		private function onSplashData( o:Object ):void
		{
			data = o.data;
			var e : ScreenEvent = new ScreenEvent( ScreenEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}