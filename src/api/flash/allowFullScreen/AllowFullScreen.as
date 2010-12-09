package api.flash.allowFullScreen
{
	import api.events.flash.allowFullScreen.AllowFullScreenEvent;

	import api.flash.Flash;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Allow or disable the ability of the Flash player to enter fullscreen mode. This feature is enabled by default.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_allowFullScreen.html Northcode Help Documentation
	*/
	public class AllowFullScreen extends Flash
	{
		/**
		* A boolean value that determines whether the Flash player is allowed to take over the display and enter fullscreen mode or not. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Flash.AllowFullScreen()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_allowFullScreen.html Northcode Help Documentation
		*/
		public function AllowFullScreen(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Allow or disable the ability of the Flash player to enter fullscreen mode. This feature is enabled by default.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_allowFullScreen.html Northcode Help Documentation
		*/
		public function allowFullScreen():void
		{
			ssCore.Flash.allowFullScreen( {flag:flag}
										 ,{callback:actionComplete, errorSTR:"allowFullScreenError", code:"21000"} );
		}
	}
}