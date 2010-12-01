package api.win.setSmartDrag
{
	import api.events.win.setSmartDrag.SetSmartDragEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setSmartDrag.html Northcode Help Documentation
	*/
	public class SetSmartDrag extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Win.SetSmartDrag()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setSmartDrag.html Northcode Help Documentation
		*/
		public function SetSmartDrag(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setSmartDrag.html Northcode Help Documentation
		*/
		public function setSmartDrag():void
		{
			ssCore.Win.setSmartDrag( {flag:flag}
								 	,{callback:actionComplete, errorSTR:"setSmartDragError", code:"6028"} );
		}
	}
}