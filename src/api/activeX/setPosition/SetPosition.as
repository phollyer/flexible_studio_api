package api.activeX.setPosition
{
	import api.activeX.ActiveX;

	import api.events.activeX.setPosition.SetPositionEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 * Set the position of the ActiveX control window, relative to the upper left corner of your Flash movie.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setPosition.html Northcode Help Documentation
	 */
	public class SetPosition extends ActiveX
	{
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * 
		 *
		 * @defaultValue <code>0</code>
		 */
		public var x:Number = 0;
		
		/**
		 * 
		 *
		 * @defaultValue <code>0</code>
		 */
		public var y:Number = 0;
		
		/**
		 * Constructor for ActiveX.SetPosition()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setPosition.html Northcode Help Documentation
		 */
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Set the position of the ActiveX control window, relative to the upper left corner of your Flash movie.
		 *
                 *
		 * @param activeXObject
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setPosition.html Northcode Help Documentation
		 */
		public function setPosition( activeXObject:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					ssCore.ActiveX.setPosition( {object:object , x:x , y:y}
											   ,{callback:actionComplete, errorSTR:"setPositionError", code:"15011"} );
			}
		}
	}
}