package api.win.setDraggable
{
	import api.events.win.setDraggable.SetDraggableEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Enable or disable the 'draggable' mode of the application window which allows you to drag your application by left clicking and dragging anywhere on the window. Note: this may affect the interactivity of your movie (buttons may no longer work properly).
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setDraggable.html Northcode Help Documentation
	*/
	public class SetDraggable extends Win
	{
		// Optional
		/**
		* A 'TRUE' or 'FALSE' value that determines whether the application window will be draggable or not. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Win.SetDraggable()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setDraggable.html Northcode Help Documentation
		*/
		public function SetDraggable(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Enable or disable the 'draggable' mode of the application window which allows you to drag your application by left clicking and dragging anywhere on the window. Note: this may affect the interactivity of your movie (buttons may no longer work properly).
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setDraggable.html Northcode Help Documentation
		*/
		public function setDraggable():void
		{
			ssCore.Win.setDraggable( {flag:flag}
								 	,{callback:actionComplete, errorSTR:"setDraggableError", code:"6022"} );
		}
	}
}