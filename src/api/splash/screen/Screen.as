/**
 * Class used only inside a Splash Screen
 * To receive data and/commands from the
 * Main Application
 **/

package api.splash.screen
{
	import api.events.splash.screen.ScreenEvent;

	import api.splash.Splash;

	import flash.events.IEventDispatcher;

	import flash.external.ExternalInterface;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_screen.html Northcode Help Documentation
	*/
	public class Screen extends Splash
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Splash.Screen()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_screen.html Northcode Help Documentation
		*/
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