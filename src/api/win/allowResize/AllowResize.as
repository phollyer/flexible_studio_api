package api.win.allowResize
{
	import api.events.win.allowResize.AllowResizeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_allowResize.html Northcode Help Documentation
	*/
	public class AllowResize extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Win.AllowResize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_allowResize.html Northcode Help Documentation
		*/
		public function AllowResize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_allowResize.html Northcode Help Documentation
		*/
		public function allowResize():void
		{
			ssCore.Win.allowResize( {flag:flag}
								   ,{callback:actionComplete, errorSTR:"allowResizeError", code:"6000"} );
		}
	}
}