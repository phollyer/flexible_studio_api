package api.script.addCode
{
	import api.events.script.addCode.AddCodeEvent;

	import api.script.Script;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>module</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_MODULE
	*/
	[Event(name="missingModule" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.script.addCode.AddCodeEvent.RESULT
	*/
	[Event(name="result", type="api.events.script.addCode.AddCodeEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_addCode.html Northcode Help Documentation
	*/
	public class AddCode extends Script
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var code:String = null;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var module:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var scriptError:String = null;
		
		/**
		* Constructor for Script.AddCode()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_addCode.html Northcode Help Documentation
		*/
		public function AddCode(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param moduleName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_addCode.html Northcode Help Documentation
		*/
		public function addCode( moduleName:String = null ):void
		{
			module = compareStrings( moduleName , module );
			
			switch( module )
			{
				case null:
					missingModule();
					break;
				default:
					var __o:Object = new Object();
					__o.module = module;
					switch( code != null )
					{
						case true:
							__o.code = code;
					}
					ssCore.Script.addCode( __o
										 ,{callback:actionComplete, errorSTR:"addCodeError", code:"35000"} );
			}
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			scriptError = r.scriptError;
			
			var e : AddCodeEvent = new AddCodeEvent( AddCodeEvent.RESULT );
			e.scriptError = scriptError;
			dispatchEvent( e );
		}
	}
}