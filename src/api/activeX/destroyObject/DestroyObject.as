package api.activeX.destroyObject
{
	import api.activeX.ActiveX;

	import api.events.activeX.destroyObject.DestroyObjectEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.destroyObject.DestroyObjectEvent.RESULT_OBJECT
	 */
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 * Remove an ActiveX Object that is embedded in your Application.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_destroyObject.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_destroyObject.html Northcode Help Documentation
	 */
	public class DestroyObject extends ActiveX
	{		
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * Constructor for ActiveX.DestroyObject()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_destroyObject.html Northcode Help Documentation
		 */
		public function DestroyObject(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Remove an ActiveX Object that is embedded in your Application.
		 * 
		 * @param activeXObject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_destroyObject.html Northcode Help Documentation
		 */
		/**
		 *
		 *
                 *
		 * @param activeXObject
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_destroyObject.html Northcode Help Documentation
		 */
		public function destroyObject( activeXObject:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					ssCore.ActiveX.destroyObject( {object:object}
												 ,{callback:actionComplete, errorSTR:"destroyObjectError", code:"15005"} );
			}
		}
	}
}