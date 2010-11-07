package api.activeX.createObject
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	import api.vos.activeX.CreateObjectVO;
	
	
	/**
	 * Dispatched when the call to the SWF Studio Method
	 * <code>ActiveX.createObject()</code> has completed successfully.
	 * 
	 * @eventType api.events.activeX.createObject.CreateObjectEvent.RESULT
	 */
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied. 
	 * 
	 * @eventType api.events.activeX.createObject.CreateObjectEvent.RESULT_OBJECT
	 */
	
	/**
	 * Dispatched when the Property <code>progID</code> has not been supplied. 
	 * 
	 * @eventType api.events.activeX.createObject.CreateObjectEvent.RESULT_PROG_ID
	 */
	
	/**
	 * Dispatched when an Error has occured when trying to complete the SWF Studio Method.
	 * 
	 * @eventTYpe api.errors.ActiveXError.CREATE_OBJECT_ERROR
	 */
	
	/**
	 * Creat a new ActiveX Object for embedding into your Application.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_createObject.html Northcode Help Documentation
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	[Event(name="missingProgID" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class CreateObject extends ActiveX
	{		
		/**
		 * The Object Identifier used to identify the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * Programmatic ID for the ActiveX Object.
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
		public var objectProperties:CreateObjectVO = new CreateObjectVO();
		
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
							createAXObject();
					}
			}
		}
		private function createAXObject():void
		{
			var __o : Object = new Object();
			__o = objectProperties;
			__o.object = object;
			__o.progID = progID;
			ssCore.ActiveX.createObject( __o , {callback:actionComplete, errorSTR:"createObjectError", code:"15004"} );
		}

	}
}