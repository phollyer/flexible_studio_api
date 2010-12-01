package api.flash.allowFullScreen
{
	import api.events.flash.allowFullScreen.AllowFullScreenEvent;

	import api.flash.Flash;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_allowFullScreen.html Northcode Help Documentation
	*/
	public class AllowFullScreen extends Flash
	{
		/**
		* 
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
		*
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