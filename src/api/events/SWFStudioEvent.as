package api.events
{
	import flash.events.Event;

	public class SWFStudioEvent extends Event
	{
		public static const ACTION_COMPLETE : String = "actionComplete";
		public static const MISSING_ALIAS : String = "missingAlias";
		public static const MISSING_APPLICATION : String = "missingApplication";
		public static const MISSING_ATTRS : String = "missingAttrs";
		public static const MISSING_BUTTON : String = "missingButton";
		public static const MISSING_CHAR : String = "missingChar";
		public static const MISSING_COLOR : String = "missingColor";
		public static const MISSING_CRITERIA : String = "missingCriteria";
		public static const MISSING_DATA :String = "missingData";
		public static const MISSING_DESTINATION : String = "missingDestination";
		public static const MISSING_DIRECTION :String = "missingDirection";
		public static const MISSING_DRIVE : String = "missingDrive";
		public static const MISSING_DRIVELETTER : String = "missingDriveletter";
		public static const MISSING_DRIVE_LETTER : String = "missingDriveLetter";
		public static const MISSING_EVENT : String = "missingEvent";
		public static const MISSING_EXISTING_FILE : String = "missingExistingFile";
		public static const MISSING_FIELDNAME : String = "missingFieldname";
		public static const MISSING_FIELD_NAME : String = "missingFieldName";
		public static const MISSING_FILE_OBJ : String = "missingFileObj";
		public static const MISSING_FLAG : String = "missingFlag";
		public static const MISSING_FOLDER : String = "missingFolder";
		public static const MISSING_FOLDER_ID : String = "missingFolderId";
		public static const MISSING_FORMAT : String = "missingFormat";
		public static const MISSING_FROM_PATH : String = "missingFromPath";
		public static const MISSING_HEADERS : String = "missingHeaders";
		public static const MISSING_HEIGHT : String = "missingHeight";
		public static const MISSING_HIGH_VALUE : String = "missingHighValue";
		public static const MISSING_HOST : String = "missingHost";
		public static const MISSING_HWND : String = "missingHwnd";
		public static const MISSING_ID : String = "missingId";
		public static const MISSING_INDEX : String = "missingIndex";
		public static const MISSING_ITEM : String = "missingItem";
		public static const MISSING_JPEG : String = "missingJpeg";
		public static const MISSING_KEY : String = "missingKey";
		public static const MISSING_LANGUAGE : String = "missingLanguage";
		public static const MISSING_LOW_VALUE : String = "missingLowValue";
		public static const MISSING_MESSAGE : String = "missingMessage";
		public static const MISSING_METHOD : String = "missingMethod";
		public static const MISSING_MODULE : String = "missingModule";
		public static const MISSING_NAME : String = "missingName";
		public static const MISSING_NEWNAME : String = "missingNewname";
		public static const MISSING_NEW_FILE : String = "missingNewFile";
		public static const MISSING_NEW_NAME : String = "missingNewName";
		public static const MISSING_NUMBER : String = "missingNumber";
		public static const MISSING_OBJECT : String = "missingObject";
		public static const MISSING_OFFSET : String = "missingOffset";
		public static const MISSING_ORIENTATION : String = "missingOrientation";
		public static const MISSING_PASSWORD : String = "missingPassword";
		public static const MISSING_PATH :String = "missingPath";
		public static const MISSING_PATTERN : String = "missingPattern";
		public static const MISSING_PERCENT : String = "missingPercent";
		public static const MISSING_PLUGIN : String = "missingPlugin";
		public static const MISSING_PORT : String = "missingPort";
		public static const MISSING_PRIORITY : String = "missingPriority";
		public static const MISSING_PROCESSID : String = "missingProcessid";
		public static const MISSING_PROCESS_ID : String = "missingProcessId";
		public static const MISSING_PROG_ID : String = "missingProgId";
		public static const MISSING_PROMPT : String = "missingPrompt";
		public static const MISSING_PROPERTY : String = "missingProperty";
		public static const MISSING_PSWD : String = "missingPswd";
		public static const MISSING_QUALITY : String = "missingQuality";
		public static const MISSING_REMOTE_PATH : String = "missingRemotePath";
		public static const MISSING_RESOURCE : String = "missingResource";
		public static const MISSING_ROOT_KEY : String = "missingRootKey";
		public static const MISSING_ROOT_VALUE : String = "missingRootValue";
		public static const MISSING_SECTION : String = "missingSection";
		public static const MISSING_SERVER : String = "missingServer";
		public static const MISSING_SHORTCUT_FILE : String = "missingShortcutFile";
		public static const MISSING_SOURCE : String = "missingSource";
		public static const MISSING_SQL :String = "missingSql";
		public static const MISSING_STRING : String = "missingString";
		public static const MISSING_SUB_KEY : String = "missingSubKey";
		public static const MISSING_SUB_VALUE : String = "missingSubValue";
		public static const MISSING_TEXT : String = "missingText";
		public static const MISSING_TO_ADDRESS : String = "missingToAddress";
		public static const MISSING_TO_PATH : String = "missingToPath";
		public static const MISSING_USER : String = "missingUser";
		public static const MISSING_USER_AGENT : String = "missingUserAgent";
		public static const MISSING_USER_ID : String = "missingUserId";
		public static const MISSING_VALUE : String = "missingValue";
		public static const MISSING_VALUE_NAME : String = "missingValueName";
		public static const MISSING_VARIABLE : String = "missingVariable";
		public static const MISSING_VARS : String = "missingVars";
		public static const MISSING_WIDTH : String = "missingWidth";
		public static const RESULT : String = "result";
		
		public function SWFStudioEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}		
		
		override public function clone():Event
		{
			var newEvent:SWFStudioEvent = new SWFStudioEvent( type );
			return newEvent;
		}
	}
}