package api.win.setDraggable
{
	import api.events.win.setDraggable.SetDraggableEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setDraggable.html Northcode Help Documentation
	*/
	public class SetDraggable extends Win
	{
		// Optional
		/**
		* 
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
		*
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