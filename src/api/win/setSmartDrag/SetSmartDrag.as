package api.win.setSmartDrag
{
	import api.events.win.setSmartDrag.SetSmartDragEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Enable or disable smart drag mode.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setSmartDrag.html Northcode Help Documentation
	*/
	public class SetSmartDrag extends Win
	{
		// Optional
		/**
		* If set to TRUE, the application will be draggable only when the cursor is a normal arrow cursor which helps preserve the interactivity of your movie. Valid values include: true and false.
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
		* Enable or disable smart drag mode.
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