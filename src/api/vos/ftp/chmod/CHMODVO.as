package api.vos.ftp.chmod
{
	import api.vos.ftp.chmod.members.GroupVO;
	import api.vos.ftp.chmod.members.OtherVO;
	import api.vos.ftp.chmod.members.UserVO;
	
	[Bindable]
	public class CHMODVO extends Object
	{
		public var group:GroupVO = new GroupVO();
		public var other:OtherVO = new OtherVO();
		public var user:UserVO = new UserVO();
		
		public function CHMODVO()
		{
			super();
		}	
	}
}