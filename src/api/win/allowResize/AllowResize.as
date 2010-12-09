package api.win.allowResize
{
	import api.events.win.allowResize.AllowResizeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Sets or clears the resize flag that controls whether the user can resize a window using drag handles when the window has a border. The window can still be minimized, maximized, restored and have its size changed in code.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_allowResize.html Northcode Help Documentation
	*/
	public class AllowResize extends Win
	{
		// Optional
		/**
		* A boolean value that determines whether a window with a border will be resizable by the user or not. Valid values include: true and false.
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
		* Sets or clears the resize flag that controls whether the user can resize a window using drag handles when the window has a border. The window can still be minimized, maximized, restored and have its size changed in code.
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