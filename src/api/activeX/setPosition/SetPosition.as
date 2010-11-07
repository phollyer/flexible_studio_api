package api.activeX.setPosition
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	
	
	/**
	 * Dispatched when the call to the SWF Studio Method
	 * <code>ActiveX.setPosition()</code> has completed successfully.
	 * 
	 * @eventType api.events.activeX.setPosition.SetPositionEvent.RESULT
	 */
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.setPosition.SetPosition.MISSING_OBJECT
	 */
	
	/**
	 * Dispatched when an Error has occured when trying to complete the SWF Studio Method.
	 * 
	 * @eventTYpe api.errors.ActiveXError.SET_POSITION_ERROR
	 */
	
	/**
	 * Set the <code>x</code> , <code>y</code> position of the ActiveX Object
	 * inside your Application. Positioning is relative to the upper left corner
	 * of your Application Window.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setPosition.html Northcode Help Documentation
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetPosition extends ActiveX
	{
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * The <code>x</code> position for the ActiveX Object in relation to the top left
		 * corner of your Application Window.
		 * 
		 * @defaultValue 0
		 */
		public var x:Number = 0;
		
		/**
		 * The <code>y</code> position for the ActiveX Object in relation to the top left
		 * corner of your Application Window.
		 * 
		 * @defaultValue 0
		 */
		public var y:Number = 0;
		
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Set the <code>x</code> , <code>y</code> position of the ActiveX Object
		 * inside your Application. Positioning is relative to the upper left corner
		 * of your Application Window.
		 * 
		 * @param activeXObject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
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
					setPos();
			}
		}
		private function setPos():void
		{
			ssCore.ActiveX.setPosition( {object:object , x:x , y:y}
									   ,{callback:actionComplete, errorSTR:"setPositionError", code:"15011"} );
		}
	}
}