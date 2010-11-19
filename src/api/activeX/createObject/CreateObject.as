package api.activeX.createObject
{
	import api.activeX.ActiveX;

	import api.events.activeX.createObject.CreateObjectEvent;

	import api.vos.activeX.CreateObjectVO;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied. 
	 * 
	 * @eventType api.events.activeX.createObject.CreateObjectEvent.RESULT_OBJECT
	 */
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	/**
	 * Dispatched when the Property <code>progID</code> has not been supplied. 
	 * 
	 * @eventType api.events.activeX.createObject.CreateObjectEvent.RESULT_PROG_ID
	 */
	[Event(name="missingProgID" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 * Creat a new ActiveX Object for embedding into your Application.
	 * 
	 * <p>Remember to set the <code>objectProperties</code> for the ActiveX Object you are embedding.</p>
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_createObject.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_createObject.html Northcode Help Documentation
	 */
	public class CreateObject extends ActiveX
	{		
		/**
		 * The Object Identifier used to identify the ActiveX Object.
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
		 * Programmatic ID for the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var progID:String = null;
		
		/**
		 * Value Object with all the required Properties necessary
		 * to create the ActiveX Object.
		 * 
		 * @defaultValue new CreateObjectVO()
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>new</code>
		 */
		public var objectProperties:CreateObjectVO = new CreateObjectVO();
		
		/**
		 * Constructor for ActiveX.CreateObject()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_createObject.html Northcode Help Documentation
		 */
		public function CreateObject(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Creat a new ActiveX Object for embedding into your Application.
		 * 
		 * @param activeXObject The Object Identifier used to identify the ActiveX Object.
		 * @param progIDString Programmatic ID for the ActiveX Object.
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_createObject.html Northcode Help Documentation
		 */
		/**
		 *
		 *
                 *
		 * @param activeXObject
                 *
		 * @param progIDString
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_createObject.html Northcode Help Documentation
		 */
		public function createObject( activeXObject:String = null , progIDString:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			progID = compareStrings( progIDString , progID );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					switch( progID )
					{
						case null:
							missingProgID();
							break;
						default:
							ssCore.ActiveX.createObject( createAXObject()
													    ,{callback:actionComplete, errorSTR:"createObjectError", code:"15004"} );
					}
			}
		}
		
		/**
		 * Create on object with the properties required  to fulfill the command.
		 * 
		 * @ private
		 */
		private function createAXObject():Object
		{
			var __o : Object = new Object();
			__o = objectProperties;
			__o.object = object;
			__o.progID = progID;
			
			return __o;
		}

	}
}