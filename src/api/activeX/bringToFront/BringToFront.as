package api.activeX.bringToFront
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	
	import api.events.activeX.bringToFront.BringToFrontEvent;
	
	/**
	 * Dispatched if the Property <code>object</code> has not bee supplied.
	 * 
	 * @eventType api.events.activeX.bringToFront.BringToFrontEvent.MISSING_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 * Bring the ActiveX Object to the front in the 'Z' order.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_bringToFront.html Northcode Help Documentation
	 */
	public class BringToFront extends ActiveX
	{
		
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		public function BringToFront(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Bring the ActiveX Object to the front of the 'Z' order.
		 * 
		 * @param activeXObject Identifier used by <code>createObject()</code> to identify the ActiveX Control.
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_bringToFront.html Northcode Help Documentation
		 */
		public function bringToFront( activeXObject:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					ssCore.ActiveX.bringToFront( {object:object} , {callback:actionComplete, errorSTR:"bringToFrontError", code:"15001"} );
			}
		}
	}
}