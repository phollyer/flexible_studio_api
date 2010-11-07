package api.script.create
{
	import flash.events.IEventDispatcher;
	import api.script.Script;

	[Event(name="missingLanguage" , type="api.events.SWFStudioEvent")]
	[Event(name="missingModule" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Create extends Script
	{
		public static const JSCRIPT:String = "jscript";
		public static const VBSCRIPT:String = "vbscript";
		
		// Required
		public var language:String = null;
		public var module:String = null;
		
		public function Create(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function create( moduleName:String = null , languageSTR:String = null ):void
		{
			module = compareStrings( moduleName , module );
			language = compareStrings( languageSTR , language );
			
			switch( module )
			{
				case null:
					missingModule();
					break;
				default:
					switch( language )
					{
						case null:
							missingLanguage();
							break;
						case JSCRIPT:
						case VBSCRIPT:
							ssCore.Script.create( {module:module , language:language}
												 ,{callback:actionComplete, errorSTR:"createError", code:"35002"} );
							break;
						default:
							invalidLanguage();
					}
			}
		}
		private function invalidLanguage():void
		{
			var e : CreateEvent = new CreateEvent( CreateEvent.RESULT_LANGUAGE );
			dispatchEvent( e );
		}

	}
}